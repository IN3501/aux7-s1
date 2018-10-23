from django.urls import path
from . import views

urlpatterns = [
	# formato: dirección_pag, función_asociada , name=nombre
    path('',        views.index,    name='index'),
    path('welcome', views.welcome,  name='welcome'),
    path('tarea',   views.tarea,    name='tarea'),
    path('inputs',   views.inputs,    name='inputs'),
]
