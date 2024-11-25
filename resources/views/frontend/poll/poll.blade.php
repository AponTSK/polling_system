@foreach ($polls as $poll)
    <div class="col-md-4 mb-4">
        <div class="card h-100 shadow-lg border-light rounded-lg overflow-hidden">
            <div class="poll-card">
                <div class="card-header bg-gradient text-dark rounded-top">
                    <h5 class="mb-0">{{ __($poll->question) }}</h5>
                    <small class="text-muted"> @lang('Deadline:') {{ $poll->expires_at ? \Carbon\Carbon::parse($poll->expires_at)->format('Y-m-d H:i:s') : 'No deadline' }}</small>
                </div>
                <div class="card-body d-flex flex-column justify-content-between">
                    <div class="row">
                        <div class="col-md-12">
                            @foreach ($poll->options as $index => $option)
                                <div class="d-flex align-items-center mb-3">
                                    @php
                                        $isExpired = $poll->expires_at && \Carbon\Carbon::parse($poll->expires_at)->isPast();
                                    @endphp
                                    <input class="form-check-input votes me-2" type="radio" data-poll_id="{{ $poll->id }}" value="{{ $option->id }}" id="flexRadio{{ $option->id }}"
                                        @if (in_array($option->id, $poll->checkOption())) checked @endif @if ($isExpired) disabled @endif @if (!in_array($option->id, $poll->checkOption()) && in_array($poll->id, $poll->checkPoll())) disabled @endif>
                                    <label class="form-check-label me-3" for="flexRadio{{ $option->id }}">
                                        {{ __($option->option) }}
                                    </label>
                                    <span class="badge bg-success text-white fw-bold">@lang('Votes') : {{ $option->votes }}</span>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
                <div class="card-footer bg-light text-end">
                    <button type="button" class="btn btn-danger btn-sm delete-poll-btn
                            @if ($poll->votes->count() > 0) d-none @endif" data-poll-id="{{ $poll->id }}">
                        @lang('Delete Poll')
                    </button>
                </div>
            </div>
        </div>
    </div>
@endforeach
