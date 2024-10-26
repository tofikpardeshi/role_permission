@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <span>{{ isset($post) ? __('Edit Post') : __('Create Post') }}</span>
                    <a class="btn btn-sm btn-warning" href="{{ url('/home') }}">{{ __('Back') }}</a>
                </div>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form action="{{  url('/post/update/' . $post->id) }}" method="post" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group">
                            <label for="name">{{ __('Name') }}</label>
                            <input type="text" class="form-control" id="name" name="name" value="{{ old('name', $post->post_name ?? '') }}">
                            @error('name')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="description">{{ __('Description') }}</label>
                            <textarea class="form-control" id="description" name="description" rows="3">{{ old('description', $post->description ?? '') }}</textarea>
                            @error('description')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="image">{{ __('Image') }}</label>
                            <input type="file" class="form-control" id="image" name="image">
                            @if(isset($post) && $post->image)
                                <div class="mt-2">
                                    <img src="{{ asset('images/' . $post->image) }}" alt="Current Image" width="100">
                                </div>
                            @endif
                            @error('image')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary mt-2">{{ ('Update')}}</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
