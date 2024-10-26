@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    @if (session('error'))
                        <div class="alert alert-danger" role="alert">
                            {{ session('error') }}
                        </div>
                    @endif
                <div class="card-header d-flex justify-content-between">
                    <span>{{ __('Post') }}
                        <button type="button" class="btn btn-primary btn-sm">
                            Notifications <span class="badge badge-light">{{
                                Auth::user()->unreadNotifications()->count()
                                }}</span>
                          </button>
                    </span>
                    @if ($create)
                        <a class="btn btn-sm btn-warning" href="{{ url('/post/create') }}">{{ __('Add Post') }}</a>
                    @endif
                </div>
                <div class="card-body">
                    <form action="{{ url('/post/search') }}" method="GET">
                        <div class="row d-flex">
                            <div class="col-md-3">
                                <input type="text" class="form-control" name="search" placeholder="search">
                            </div>
                            <div class="col-md-3">
                                <input type="date" class="form-control" name="start_date" placeholder="start date"
                                max="{{  date('Y-m-d') }}">
                                @error('start_date')
                                <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="col-md-3">
                                <input type="date" class="form-control" name="end_date" placeholder="end date"
                                max="{{  date('Y-m-d') }}">
                                @error('end_date')
                                <small class="text-danger">{{ $message }}</small>
                                @enderror
                            </div>
                            <div class="col-md-2">
                                <button type="submit" class="btn  btn-primary ml-2">Search</button>
                            </div>
                        </div>
                    </form>
                    <table class="table table-striped">
                        <thead>
                          <tr>
                            <th scope="col">S. No</th>
                            <th scope="col">Name</th>
                            <th scope="col">Decription</th>
                            <th scope="col">Role</th>
                            <th scope="col">Created By</th>
                            <th scope="col">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                            @foreach($posts as $key => $post)
                                <tr>
                                    @php
                                         $roleName =DB::table('roles')->where('id',$post->creator->role_id)->value('name');
                                    @endphp
                                    <th scope="row">{{$key+1}}</th>
                                    <td>
                                        @if($post->image)
                                        <img src="{{ asset('/storage/images/'. $post->image) }}" alt="Post Image" width="50">
                                        {{ $post->post_name }}
                                        @else
                                        {{ $post->post_name }}
                                        @endif
                                    </td>
                                    <td title="{{ $post->description }}">{{ \Str::limit($post->description, 50) }}</td>
                                    <td>{{$roleName }}</td>  <!-- Display role name -->  <!-- Replace role_id with role name in your database -->  <!-- Fetch role name using role_id -->
                                    <td>{{  $post->creator->name  }}</td>
                                    <td>
                                        @if($edit)
                                            <a class="btn btn-sm btn-primary" href="{{ url('/post/edit/'.$post->id) }}">edit</a>
                                        @endif
                                        @if ($delete)
                                        <form action="{{ url('/post/delete/'.$post->id) }}" method="POST" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this post?');">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                                        </form>
                                        @endif

                                    </td>
                                </tr>
                            @endforeach
                        </tbody>

                      </table>

                      <ul class="pagination pagination-rounded justify-content-end mb-0 mt-2">
                        {{ $posts->links('pagination::bootstrap-4') }}
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
