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
        Schema::table('products', function (Blueprint $table) {
            $table->longText('images')->nullable()->collation('utf8mb4_bin')->check('json_valid(`images`)');
            $table->string('images_driver', 255)->nullable();
            // $table->foreignId('taxonomy_id')->constrained('projects')->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products_tables', function (Blueprint $table) {
            $table->dropColumn('images');
            $table->dropColumn('images_driver');
        });
    }
};
