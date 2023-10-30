<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ContactWithAuthor extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public $subject;
    public $user_message;
    public $user_email;
    public function __construct($subject, $user_message, $user_email,)
    {
        $this->subject = $subject;
        $this->user_message = $user_message;
        $this->user_email = $user_email;
    }

    public function build()
    {
        $subject=$this->subject;
        $user_message=$this->user_message;
        $user_email=$this->user_email;

        return $this->from($user_email)->subject($subject)->view('user.contact_with_author',compact('user_message'));
    }
}
