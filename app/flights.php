<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class flights extends Model
{
    protected $fillable = [

        'id', 'type', 'payload'

    ];

    
}
