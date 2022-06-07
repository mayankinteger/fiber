from email.message import EmailMessage
from django.dispatch import receiver
from django.http import JsonResponse
from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth  import authenticate,  login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.views.decorators.csrf import csrf_exempt
from activity.models import *
from bill.models import *
from ..forms import TaskForm, TaskmediaForm, TaskcommentForm
from ..filters import ActivityFilter
import datetime
from datetime import date, timedelta
from django.core.mail import send_mail
from django.conf import settings
from random import randint
from django.core.serializers import serialize

#html email required stuff
from django.core.mail import EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.urls import resolve