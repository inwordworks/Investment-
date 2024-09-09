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
        Schema::create('payout_methods', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('code')->nullable();
            $table->string('description')->nullable();
            $table->text('bank_name')->nullable()->comment('automatic payment for bank name');
            $table->text('banks')->nullable()->comment('admin bank permission');
            $table->text('parameters')->nullable()->comment('api parameters');
            $table->text('extra_parameters')->nullable();
            $table->text('inputForm')->nullable();
            $table->text('currency_lists')->nullable();
            $table->text('supported_currency')->nullable();
            $table->text('payout_currencies')->nullable();
            $table->tinyInteger('is_active')->default(1)->comment('1 = active, 0 = inactive');
            $table->tinyInteger('is_automatic')->default(0);
            $table->tinyInteger('is_sandbox')->default(0);
            $table->enum('environment', ['test', 'live'])->default('live');
            $table->tinyInteger('confirm_payout')->default(1);
            $table->tinyInteger('is_auto_update')->default(1)->comment('currency rate auto update');
            $table->tinyInteger('currency_type')->default(1);
            $table->string('logo')->nullable();
            $table->string('driver', 20)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payout_methods');
    }
};
