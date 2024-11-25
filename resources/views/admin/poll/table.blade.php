<table class="table align-items-center mb-0 ">
    <thead>
        <tr>
            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                @lang('Question')
            </th>
            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">
                @lang('options')
            </th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                @lang('votes')
            </th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                @lang('Deadline')
            </th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">@lang('Activity')</th>
            <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">@lang('Action')</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($polls as $poll)
            <tr>
                <td>
                    <div class="d-flex px-2 py-1">

                        <div class="d-flex flex-column justify-content-center">
                            <p class="text-xs text-secondary mb-0">
                                {{ __($poll->question) }}
                            </p>
                        </div>
                    </div>
                </td>
                <td>
                    @foreach ($poll->options as $option)
                        <p class="text-xs text-secondary">
                            {{ __($option->option) }} : {{ __($option->votes) }}
                        </p>
                        </br>
                    @endforeach

                </td>
                <td class="align-middle text-center text-sm">
                    <span class="badge badge-sm bg-gradient-success">{{ count($poll->votes) }}</span>
                </td>
                <td class="align-middle text-center">
                    <span class="text-secondary text-xs font-weight-bold">{{ \Carbon\Carbon::parse($poll->expires_at)->format('d-m-Y') }}<br>
                        {{ \Carbon\Carbon::parse($poll->expires_at)->format('h:i:s A') }}</span>
                </td>
                <td class="align-middle text-center">
                    <button class="toggle-status-btn btn-sm btn {{ $poll->status ? 'btn-danger' : 'btn-success' }}" data-action="{{ route('admin.poll.status', $poll->id) }}">
                        {{ $poll->status ? 'Deactivate' : 'Activate' }}
                    </button>
                </td>
                <td class="align-middle text-center">
                    <button type="button" class="btn btn-danger btn-sm delete-poll-btn" data-poll-id="{{ $poll->id }}">
                        @lang('Delete Poll')
                    </button>
                </td>
            </tr>
        @endforeach
    </tbody>
</table>
