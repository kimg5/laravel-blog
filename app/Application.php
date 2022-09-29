<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Application extends Model
{
    public $timestamps = false;
    protected $table = 'applications';
    protected $fillable = [
        'name', 'content'
    ];
}
