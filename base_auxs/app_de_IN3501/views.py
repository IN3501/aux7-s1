from django.shortcuts import render
from .models import Usuarios

# Create your views here.
def index(request):
	#aqui se define el diccionario con la información que rellenará el template
    contexto = {'cargo1':"Auxiliares",'cargo2':"Profesores", 'cargo3':"Ayudantes"}
    return render(request, 'app_de_IN3501/index.html', contexto)


def welcome(request):
    return render(request, 'app_de_IN3501/bienvenida.html')

	
def tarea(request):
    return render(request, 'app_de_IN3501/tarea.html')

def inputs(request):
	return render(request, 'app_de_IN3501/inputs.html')

def formulario_dudas(request):
	return render(request, 'app_de_IN3501/formulario_dudas.html')

def lista_usuarios(request):
	contexto = {}
	contexto['usuarios'] = Usuarios.objects.all()
	contexto['may_700'] = Usuarios.objects.filter(puntaje_psu__gte=700)
	contexto['men_700'] = Usuarios.objects.filter(puntaje_psu__lte=700)
	return render(request, 'app_de_IN3501/lista_usuarios.html', contexto)

