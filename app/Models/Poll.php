<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Poll extends Model
{
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function options()
    {
        return $this->hasMany(PollOption::class);
    }

    public function votes()
    {
        return $this->hasMany(PollVote::class);
    }

    public function checkOption()
    {
        $optionId = $this->votes()->where('user_id', auth()->id())->pluck('poll_option_id')->toArray();
        return $optionId;
    }

    public function checkPoll()
    {
        $pollId = $this->votes()->where('user_id', auth()->id())->pluck('poll_id')->toArray();
        return $pollId;
    }
}
