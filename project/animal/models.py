from django.db import models


class Shop(models.Model):
    name = models.CharField(max_length=256)


class Pet(models.Model):
    shop = models.ForeignKey(Shop, on_delete=models.CASCADE, null=False)
    name = models.CharField(max_length=256)
