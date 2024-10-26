<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Post;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use App\Notifications\PostPublished;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;



class PostController extends Controller
{
    public function index()
    {

        $users = Auth::user()->role_id;
        $roles = DB::table('roles')->where('id', Auth::user()->role_id)->first();

        $role = Role::find(Auth::user()->role_id); // Replace with your actual role ID

        $edit = $role->hasPermissionTo('post-edit');
        $delete = $role->hasPermissionTo('post-delete');
        $create = $role->hasPermissionTo('post-create');



        if($users == 1 || $roles == 'admin' || $roles == 'Admin')
        {
            $posts = Post::paginate(10);
        }
        else
        {
            $posts = Post::where('created_by',Auth::user()->id)->paginate(10);
        }

        return view('home', compact(['posts','edit','delete','create']));

    }

    public function createPage()
    {
        return view('post.add-post');
    }


    public function create(Request $request)
    {
        // Validate request
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'description' => ['required', 'string', 'max:255'],
            'image' => ['image', 'mimes:jpeg,png,jpg'],
        ]);

        // Handle file upload if the file exists
        $imageName = null;
        if ($request->hasFile('image')) {
            $imageName = time() . '.' . $request->image->getClientOriginalExtension();
            $request->image->storeAs('images', $imageName, 'public'); // store in /storage/app/public/images
        }


        // Save to database
        $post = new Post();
        $post->post_name = $request->name;
        $post->description = $request->description;
        $post->image = $imageName;
        $post->created_by = Auth::id();


        $post->save();

            // Fetch all users
        $users = User::all();

        // Send the notification to each user
        foreach ($users as $user) {
            $user->notify(new PostPublished($post));
        }

        return redirect()->route('home')->with('status', 'Post created successfully!');
    }

    public function edit($id)
    {
        $post = Post::find($id);
        return view('post.edit-post', compact('post'));
    }

    public function savePost(Request $request, $id)
    {
        // Validate request
        $request->validate([
            'name' => ['required','string','max:255'],
            'description' => ['required','string','max:255'],
            'image' => ['image','mimes:jpeg,png,jpg'],
        ]);

        // Handle file upload if the file exists
        $imageName = null;
        if ($request->hasFile('image')) {
            $imageName = time(). '.'. $request->image->getClientOriginalExtension();
            $request->image->storeAs('images', $imageName, 'public'); // store in /storage/app/public/images
        }

        // Update database
        $post = Post::find($id);
        $post->post_name = $request->name;
        $post->description = $request->description;
        if ($imageName) {
            $post->image = $imageName;
        }
        $post->save();

        return redirect()->route('home')->with('status', 'Post updated successfully!');
    }

    public function destroy($id)
    {
        $post = Post::find($id);
        $post->delete();
        return redirect()->route('home')->with('status', 'Post deleted successfully!');
    }

    public function postSearch(Request $request)
    {

        $request->validate([
            'search' => ['nullable', 'string', 'max:255'],           // Nullable search field for optional search
            'start_date' => ['nullable', 'date'],                    // Start date can be null or a valid date
            'end_date' => ['nullable', 'date', 'after_or_equal:start_date'], // End date must be a date after or equal to start date
        ]);


        $search = $request->search;
        $startDate = $request->input('start_date') ? Carbon::parse($request->input('start_date')) : null;
        $endDate = $request->input('end_date') ? Carbon::parse($request->input('end_date')) : null;

        $role = Role::find(Auth::user()->role_id); // Replace with your actual role ID

        $edit = $role->hasPermissionTo('post-edit');
        $delete = $role->hasPermissionTo('post-delete');
        $create = $role->hasPermissionTo('post-create');

        $posts = Post::query()
        ->join('users', 'posts.created_by', '=', 'users.id')
        ->select('posts.*', 'users.name as user_name','users.created_at');

        // Apply role filter if user is not admin
        if(Auth::user()->role_id!= 1)
        {
            $posts->where('posts.created_by', Auth::user()->id);
        }


        // Apply search filter if a search term is provided
        if (!empty($search)) {
            $posts->where(function ($query) use ($search) {
                $query->where('post_name', 'LIKE', '%' . $search . '%')
                    ->orWhere('description', 'LIKE', '%' . $search . '%')
                    ->orWhere('users.name', 'LIKE', '%' . $search. '%');
            });
        }

        // Apply date filter if both start and end dates are provided
        if (!empty($startDate) && !empty($endDate)) {
            $posts->whereBetween(DB::raw('DATE(posts.created_at)'), [$startDate, $endDate]);
        }

        // Execute the query with pagination
        $posts = $posts->paginate(20);

        if($posts->isEmpty())
        {
            return redirect()->route('home')->with('error', 'No post found matching your search criteria.');
        }

        return view('home', compact(['posts','edit','delete','create']));

    }

}
