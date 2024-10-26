@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <span>{{ isset($role) ? __('Edit Role') : __('Create Role') }}</span>
                    <a class="btn btn-sm btn-warning" href="{{ url('/role') }}">{{ __('Back') }}</a>
                </div>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form action="{{ isset($role) ? url('/role/update/' . $role->id) : url('/add/role') }}" method="post">
                        @csrf

                        <div class="form-group">
                            <label for="role">{{ __('Role') }}</label>
                            <input type="text" class="form-control" id="role" name="role" value="{{ old('role', $role->name ?? '') }}">
                            @error('role')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="permission">{{ __('Permissions') }}</label>
                            <div>
                                @foreach ($permissions as $item)
                                    <input type="checkbox" name="permissions[]" id="permission_{{ $item->id }}" value="{{ $item->id }}"
                                        {{ isset($role) && $role->permissions->contains($item->id) ? 'checked' : '' }} />
                                    <label for="permission_{{ $item->id }}">{{ $item->name }}</label>
                                @endforeach
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary mt-2">{{ isset($role) ? __('Update') : __('Save') }}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
