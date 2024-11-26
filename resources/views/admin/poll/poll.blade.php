<div class="container-fluid py-2">
    <div class="row">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-dark shadow-dark border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">@lang('Polls')</h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="table-responsive p-0 poll-table">
                        @include('admin.poll.table')
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


@push('script')
    <script>
        $(document).ready(function() {
            $(document).on('click', '.toggle-status-btn', function() {
                const url = $(this).data('action');
                const button = $(this);

                $.ajax({
                    type: "POST",
                    url: url,
                    data: {
                        '_token': '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        if (response.status = 'success') {

                            const newStatus = response.poll.status == 1 ? 'Deactivate' : 'Activate';
                            button.text(newStatus);
                            if (response.poll.status == 1) {
                                button.removeClass('btn-success').addClass('btn-danger');
                                alert(response.message)
                            } else {
                                button.removeClass('btn-danger').addClass('btn-success');
                                alert(response.message)
                            }

                        } else {

                            alert(response.message)
                        }
                    }
                });

            });

            $(document).on('click', '.delete-poll-btn', function() {
                const url = $(this).data('action');

                if (confirm("Are you sure you want to delete this pioll?")) {
                    $.ajax({
                        type: "GET",
                        url: url,
                        success: function(response) {
                            if (response.success) {
                                alert(response.message);
                                $('.poll-table').html(response.html);
                            }
                        }
                    });
                }
            })

        });
    </script>
@endpush
