<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class HotelRoomType extends Model
{
    public $timestamps = false;

    protected $guarded = [];

    protected $hidden = ['id', 'hotel_code', 'room_type_code', 'hotel'];

    protected function casts(): array
    {
        return [
            'quantity' => 'integer',
            'price' => 'float',
        ];
    }

    public function hotel(): BelongsTo
    {
        return $this->belongsTo(Hotel::class);
    }

    public function roomType(): BelongsTo
    {
        return $this->belongsTo(RoomType::class);
    }

    public function toArray(): array
    {
        return [
            'roomType' => $this->relationLoaded('roomType')
                ? $this->getRelation('roomType')->toArray()
                : null,
            'quantity' => $this->quantity,
            'price' => $this->price,
        ];
    }
}
