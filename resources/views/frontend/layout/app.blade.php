<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@lang('Polling System')</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #114476;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(135deg, #626cc1, #12132b);
            padding: 20px 40px;
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        header h3 {
            font-size: 2rem;
            font-weight: 600;
        }

        header .username {
            font-size: 1.1rem;
            font-weight: 500;
        }

        header .logout-btn {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        header .logout-btn:hover {
            background-color: #c82333;
        }


        .hero-section {
            background: linear-gradient(135deg, #5dad9e, #a3afe6);
            color: white;
            padding: 40px 20px;
            text-align: center;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
            margin-bottom: 30px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .hero-section h1 {
            font-size: 28px;
            margin-bottom: 10px;
        }

        .hero-section p {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .poll-card {
            background: linear-gradient(135deg, #f6f7fb, #e9eff5);
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .poll-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        .poll-card .card-body {
            padding: 24px;
        }

        .poll-card .card-body h5 {
            font-size: 1.6rem;
            font-weight: 600;
            color: #333;
            margin-bottom: 12px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .poll-card .card-body p {
            font-size: 1.1rem;
            color: #666;
            line-height: 1.6;
            font-family: 'Arial', sans-serif;
            margin-bottom: 20px;
        }

        .poll-card .card-body a {
            font-size: 1.1rem;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .poll-card .card-body a:hover {
            color: #0056b3;
        }


        .option-field {
            margin-bottom: 10px;
        }

        .fixed-card {
            width: 300px;
            height: auto;
            overflow-y: auto;
            padding: 15px;
            width: 100%;
        }
    </style>

</head>

<body>
    <header class="d-flex justify-content-between align-items-center">
        <div class="d-flex align-items-center">
            <h3>@lang('Polling System')</h3>
        </div>
        <div class="d-flex align-items-center">
            <div><span class="username me-3">@lang('Hello'), <strong id="username">{{ __(Auth::user()->name) }}</strong></span></div>
            <form method="POST" action="{{ route('logout') }}">
                @csrf

                <button class="logout-btn" href="route('logout')" onclick="event.preventDefault();
                                    this.closest('form').submit();">
                    {{ __('Log Out') }}
                </button>
            </form>
        </div>
    </header>

    @yield('content')



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    @stack('script')
</body>

</html>
