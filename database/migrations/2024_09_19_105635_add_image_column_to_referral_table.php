<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('referral', function (Blueprint $table) {
            $table->string('reward_image_driver', 255)->after('amount_type')->nullable();
            $table->string('reward_image', 255)->after('amount_type')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('referral', function (Blueprint $table) {
            $table->dropColumn('reward_image');
            $table->dropColumn('reward_image_driver');
        });
    }
};
