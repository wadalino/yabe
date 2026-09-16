<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Hotel extends Model
{
    public $timestamps = false;

    protected $guarded = [];

    protected $hidden = ['id'];

    public function roomTypes(): HasMany
    {
        return $this->hasMany(HotelRoomType::class);
    }

    public function toArray(): array
    {
        return [
            'name' => $this->name,
            'code' => $this->code,
            'roomTypes' => $this->relationLoaded('roomTypes')
                ? $this->getRelation('roomTypes')->values()->toArray()
                : [],
        ];
    }
}
