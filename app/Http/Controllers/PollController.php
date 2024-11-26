<?php

namespace App\Http\Controllers;

use App\Models\Poll;
use App\Models\PollOption;
use App\Models\PollVote;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class PollController extends Controller
{
    public function index(Request $request)
    {
        $pollsQuery = Poll::where('status', 1);
        if ($request->has('active') && $request->active === 'true')
        {
            $pollsQuery->where('expires_at', '>', now());
        }

        if ($request->has('most_voted') && $request->most_voted === 'true')
        {
            $pollsQuery->withCount('votes')
                ->orderByDesc('votes_count');
        }

        $polls = $pollsQuery->with('user')->get();


        if (request()->ajax())
        {

            $html = view('frontend.poll.poll', compact('polls'))->render();

            return response()->json([
                'success' => true,
                'html' => $html
            ]);
        }
        else
        {
            return view('frontend.poll.index', compact('polls'));
        }
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'question' => 'required|string',
            'options' => 'required|array|min:2',
            'expires_at' => 'required|date|after:today',
        ]);

        if ($validator->fails())
        {
            return response()->json([
                'success' => false,
                'message' => $validator->errors()->all(),
            ]);
        }

        $poll = new Poll();
        $poll->question = $request->question;
        $poll->user_id = Auth::id();
        $expiresAt = Carbon::parse($request->expires_at);
        $poll->expires_at = $expiresAt;
        $poll->save();

        $options = $request->options;

        foreach ($options as $item)
        {
            $option = new PollOption();
            $option->poll_id = $poll->id;
            $option->option = $item;
            $option->save();
        }

        return response()->json([
            'success' => true,
            'message' => 'Poll created successfully!',
        ]);
    }

    public function votes(Request $request)
    {
        $poll = Poll::find($request->poll_id);

        if (!$poll)
        {
            return response()->json([
                'success' => false,
                'message' => 'Poll not found!',
            ]);
        }

        if ($poll->expires_at && $poll->expires_at <= now())
        {
            return response()->json([
                'success' => false,
                'message' => 'This poll has expired.'
            ]);
        }

        $option = PollOption::where('poll_id', $request->poll_id)->find($request->option_id);

        if (!$option)
        {
            return response()->json([
                'success' => 'false',
                'message' => 'Option not found',
            ]);
        }

        $hasVotes = PollVote::where('user_id', auth()->id())->where('poll_id', $request->poll_id)->exists();

        if ($hasVotes)
        {
            return response()->json([
                'success' => false,
                'message' => 'Vote already esists',
            ]);
        }

        $option->votes += 1;
        $option->save();

        $pollVote = new PollVote();
        $pollVote->poll_id = $poll->id;
        $pollVote->user_id = auth()->id();
        $pollVote->poll_option_id = $option->id;
        $pollVote->save();

        return response()->json([
            'success' => true,
            'message' => 'vote submitted successfully',
            'votes' => $option->votes,
        ]);
    }

    public function delete(Request $request)
    {
        $poll = Poll::find($request->poll_id);

        if ($poll->user_id != auth()->id())
        {
            return response()->json(['success' => false, 'message' => 'You are not authorized to delete this poll.']);
        }

        if ($poll->votes->count() > 0)
        {
            return response()->json(['success' => false, 'message' => 'You cannot delete this poll because votes have been cast.']);
        }

        $poll->delete();

        return response()->json(['success' => true, 'message' => 'Poll deleted successfully.']);
    }
}
