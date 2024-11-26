@extends('frontend.layout.app')
@section('content')
    <section class="hero-section">
        <div class="container">
            <h1>@lang('Welcome to the Polling System')</h1>
            <p>@lang('voice matters! Participate in polls and make a difference.') </p>
            <button type="button" class="btn btn-sm-custom btn-primary" data-bs-toggle="modal" data-bs-target="#optionModal">@lang('Create Poll')</button>
        </div>
    </section>

    <div class="container my-5 ">

        <div class="mb-3">
            <div class="btn-group">
                <button class="btn btn-primary btn-filter dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                    @lang('Filter Polls')
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item filter-btn" href="#" data-filter="active" data-value="true">@lang('Active Polls')</a></li>
                    <li><a class="dropdown-item filter-btn" href="#" data-filter="most_voted" data-value="true">@lang('Most Voted')</a></li>
                </ul>
            </div>
        </div>
        <div class="row poll-parent">
            <div class="poll-list-container row">
                @include('frontend.poll.poll')
            </div>
        </div>
    </div>

    <div class="modal fade" id="optionModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="optionModalLabel">@lang('Create New Poll')</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form class="pollForm" method="post">
                        @csrf
                        <div class="mb-3">
                            <label for="poll-question" class="form-label">@lang('Poll Question:')</label>
                            <div class="input-group">
                                <input type="text" class="form-control" name="question" id="poll-question" value="{{ request()->question }}" placeholder="@lang('Enter your question here')" required>
                                <span class="input-group-text add-btn bg-success text-white">@lang('Add Option')</span>
                            </div>
                            @error('question')
                                <div class="alert alert-danger">{{ __($message) }}</div>
                            @enderror
                        </div>
                        <div class="form-group mb-3">
                            <label for="expires_at" class="form-label">@lang('Expiry Date')</label>
                            <input type="datetime-local" id="expires_at" name="expires_at" class="form-control">
                            @error('expires_at')
                                <div class="alert alert-danger">{{ __($message) }}</div>
                            @enderror
                        </div>
                        <div class="option-wrapper row mb-3">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="" class="form-label">@lang('Option')</label>
                                    <div class="option-list">
                                        <div class="input-group mb-3">
                                            <input type="text" class="form-control" name="options[]" value="{{ request()->question }}" required>
                                            @error('options')
                                                <div class="alert alert-danger">{{ __($message) }}</div>
                                            @enderror
                                            <span class="input-group-text bg-danger text-white close-btn cursor-default">X</span>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-sm btn-dark" data-bs-dismiss="modal">@lang('Close')</button>
                            <button type="submit" class="btn btn-sm btn-success" id="save-poll">@lang('Save Poll')</button>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>

    @push('script')
        <script>
            $(document).ready(function() {

                var index = 0
                $('.add-btn').on('click', function() {
                    $('.option-wrapper').append(
                        `<div class="input-group mb-3">
                    <input type="text" class="form-control" name="options[]" required>
                    <span class="input-group-text bg-danger text-white close-btn cursor-default">X</span>
                </div>`
                    );
                });

                $('.option-wrapper').on('click', '.close-btn', function() {
                    $(this).closest('.input-group').remove();
                });

                $('.pollForm').on('submit', function(e) {
                    e.preventDefault();
                    var formData = new FormData(this)
                    $.ajax({
                        type: "post",
                        url: "{{ route('poll.store') }}",
                        data: formData,
                        contentType: false,
                        processData: false,
                        success: function(response) {


                            if (response.success) {
                                getPollList();
                                $('#optionModal').modal('hide');
                            }
                            alert(response.message);
                        }

                    });
                });

                $(document).on('click', '.votes', function() {
                    const pollId = $(this).data('poll_id');
                    const optionId = $(this).val();
                    const deadline = $(this).closest('.card').find('p').text().split("Deadline: ")[1];
                    const currentTime = new Date().toISOString();

                    if (new Date(deadline) <= new Date(currentTime)) {
                        alert("This poll has expired. You cannot vote anymore.");
                        return;
                    }

                    $.ajax({
                        type: "POST",
                        url: "{{ route('poll.vote') }}",
                        data: {
                            'poll_id': pollId,
                            'option_id': optionId,
                        },
                        headers: {
                            'X-CSRF-TOKEN': '{{ csrf_token() }}'
                        },
                        dataType: "json",
                        success: function(response) {
                            getPollList();
                            alert(response.message);
                        }

                    });
                });

                $(document).on('click', '.delete-poll-btn', function() {

                    const pollId = $(this).data('poll-id');

                    if (confirm("Are you sure you want to delete this poll?")) {
                        $.ajax({
                            type: "GET",
                            url: "{{ route('poll.delete', ['id' => '__id__']) }}".replace('__id__', pollId),
                            data: {
                                'poll_id': pollId,
                                '_token': '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                if (response.success) {
                                    getPollList();
                                    alert(response.message);
                                } else {
                                    alert(response.message);
                                }
                            }
                        });
                    }
                });

                $('.filter-btn').on('click', function() {
                    var filter = $(this).data('filter');
                    var value = $(this).data('value');
                    var selectedText = $(this).text();

                    $('.btn-filter').text(selectedText);

                    $.ajax({
                        url: "{{ route('poll.index') }}",
                        type: 'GET',
                        data: {
                            [filter]: value
                        },
                        success: function(response) {
                            if (response.success) {
                                $('.poll-list-container').html(response.html);
                            }
                        }
                    });
                });

                function getPollList() {
                    $.ajax({
                        url: "{{ route('poll.index') }}",
                        type: 'GET',
                        dataType: 'json',
                        success: function(response) {
                            console.log(response);

                            if (response.success) {
                                $('.poll-parent').html(response.html);
                            }
                        }
                    });
                }


            });
        </script>
    @endpush
@endsection
