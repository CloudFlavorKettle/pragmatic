from django.shortcuts import render

# Create your views here.
def index(requset):
    return render(requset, 'chatapp/index.html')

def room(request, room_name):
    return render(request, 'chatapp/room.html', {
        'room_name': room_name
    })