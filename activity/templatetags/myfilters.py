from django import template
from django.template.defaultfilters import stringfilter

register = template.Library()


#def split(value, arg):
#    return value.split(arg)

#register.filter("mysplit",split)

@register.filter
def toInt(string):
    return int(string)


@register.filter
def toStr(integer):
    return str(integer)

@register.filter
def mysplit(value):
    filename = value.split("/")
    return filename[-1]

def cutlast(value, elements):
    return str(value[:len(value)-elements])

register.filter("mycut",cutlast)