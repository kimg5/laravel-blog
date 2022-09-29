<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class report extends Model
{
    public $timestamps = false;

    protected $table = 'reports';

    protected $fillable = [

        'type', 'created_at','severity','priority','summary','description','name'

    ];
}
