@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header d-flex justify-content-between">
                    <span>{{ __('Role') }}</span>
                    <a class="btn btn-sm btn-warning" href="{{ url('/role') }}">{{ __('Back') }}</a>
                </div>
                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    <form action="{{ url('/add/role') }}" method="post">
                        @csrf
                        <div class="form-group">
                            <label for="role">{{ __('Role') }}</label>
                            <input type="text" class="form-control" id="role" name="role">
                            @error('role')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="permission">{{ __('Image') }}</label>
                            <div>
                                @foreach ($permissions as $item)
                                <input type="checkbox" name="permission" id="permission[]" value="{{ $item->id }}" />
                                <label for="permission">{{ $item->name }}</label>
                                @endforeach

                            </div>
                        <button type="submit" class="btn btn-primary mt-2">{{ __('Save') }}</button>
                    </form>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
