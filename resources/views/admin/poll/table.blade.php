<table class="table align-items-center mb-0">
    <thead>
        <tr>
            <th class="text-uppercase text-secondary fw-bold text-sm p-3">@lang('Question')</th>
            <th class="text-uppercase text-secondary fw-bold text-sm p-1">@lang('Options')</th>
            <th class="text-center text-uppercase text-secondary fw-bold text-sm p-1">@lang('Votes')</th>
            <th class="text-center text-uppercase text-secondary fw-bold text-sm p-2">@lang('Deadline')</th>
            <th class="text-center text-uppercase text-secondary fw-bold text-sm p-2">@lang('Activity')</th>
            <th class="text-center text-uppercase text-secondary fw-bold text-sm p-2">@lang('Action')</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($polls as $poll)
            <tr>
                <td class="p-3">
                    <div class="d-flex">
                        <div class="d-flex flex-column">
                            <p class="text-sm mb-1">{{ __($poll->question) }}</p>
                        </div>
                    </div>
                </td>
                <td class="p-1">
                    @foreach ($poll->options as $option)
                        <p class="text-sm mb-1">{{ __($option->option) }} : {{ __($option->votes) }}</p>
                    @endforeach
                </td>
                <td class="align-middle text-center p-1">
                    <span class="badge bg-success text-sm">{{ count($poll->votes) }}</span>
                </td>
                <td class="align-middle text-center p-2">
                    <span class="text-sm fw-bold">{{ \Carbon\Carbon::parse($poll->expires_at)->format('d-m-Y') }}<br>
                        {{ \Carbon\Carbon::parse($poll->expires_at)->format('h:i:s A') }}</span>
                </td>
                <td class="align-middle text-center p-2">
                    <button class="btn btn-sm {{ $poll->status ? 'btn-danger' : 'btn-success' }} toggle-status-btn" data-action="{{ route('admin.poll.status', $poll->id) }}">
                        {{ $poll->status ? 'Deactivate' : 'Activate' }}
                    </button>
                </td>
                <td class="align-middle text-center p-2">
                    <button type="button" data-action="{{ route('admin.poll.delete', $poll->id) }}" class="btn btn-sm btn-danger delete-poll-btn" data-poll-id="{{ $poll->id }}">
                        @lang('Delete Poll')
                    </button>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
