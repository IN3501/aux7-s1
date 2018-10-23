from django.shortcuts import render

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