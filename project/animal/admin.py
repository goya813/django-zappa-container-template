from django.contrib import admin

from animal.models import Shop, Pet


@admin.register(Shop)
class ShopAdmin(admin.ModelAdmin):
    list_display = ("name",)


@admin.register(Pet)
class ShopAdmin(admin.ModelAdmin):
    list_display = ("shop", "name")
