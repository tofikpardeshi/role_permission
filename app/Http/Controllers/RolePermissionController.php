<?php

namespace App\Http\Controllers;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;

use Illuminate\Http\Request;

class RolePermissionController extends Controller
{
    public function getRole()
    {
        $roles = Role::all();
        $permissions = Permission::all();
        return view('roles.index', compact('roles', 'permissions'));
    }

    public function RolePage()
    {
        $permissions = Permission::all();
        return view('roles.create-role', compact('permissions'));
    }

    public function createRole(Request $request)
    {
        // Validate the incoming request data
        $request->validate([
            'role' => 'required|string|max:255',
            'permissions' => 'nullable|array', // Ensure permissions is an array
            'permissions.*' => 'exists:permissions,id', // Each permission should exist in the database
        ]);

        $role = new Role();
        $role->name = $request->role;
        $role->guard_name = 'web';
        $role->save();

        // Check if permissions are set and not null
        if ($request->has('permissions') && is_array($request->permissions)) {
            $permissions = Permission::whereIn('id', $request->permissions)->get();
            $role->syncPermissions($permissions);
        }

        return redirect()->back()->with('status', 'Role created successfully!');
    }


    public function edit($id)
    {
        $role = Role::find($id);
        $permissions = Permission::all();
        return view('roles.update-role', compact('role', 'permissions'));
    }

    public function updateRole(Request $request, $id)
    {
        $role = Role::find($id);
        $role->name = $request->role;
        $role->save();

        // Retrieve the permissions by their IDs and sync them with the role
        $permissions = Permission::whereIn('id', $request->permissions)->get();
        $role->syncPermissions($permissions);

        return redirect()->route('get.role')->with('status', 'Role updated successfully!');
    }

    public function destroy($id)
    {
        // Find the role by its ID and delete it
        $role = Role::find($id);
        $role->delete();
        // Remove all permissions from the role
        $role->syncPermissions([]);

        // Delete the role itself
        $role->delete();

        // Redirect to the roles page with a success message
        return redirect()->route('get.role')->with('status', 'Role deleted successfully!');
    }
}
