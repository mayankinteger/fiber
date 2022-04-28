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

def job_status_list():
    Job_status = [
    ('', '--Select--'),
    (1, 'Pending'),
    (2, 'Ongoing'),
    (3, 'Complete')
    ]
    
    return Job_status


@register.filter
def job_status(value):
    jobstat = job_status_list()
    jobstat_dict = dict(jobstat)
    return jobstat_dict[value]

def bucket_list():
    bucket = [
    ('', '--Select--'),
    (1, 'Client'),
    (2, 'Integer')
    ]
    
    return bucket


@register.filter
def bucket(value):
    bucket = bucket_list()
    bucket_dict = dict(bucket)
    return bucket_dict[value]

def invoicing_status_list():
    invoicing_status = [
    ('', '--Select--'),
    (1, 'Pending'),
    (2, 'Ongoing'),
    (3, 'Complete')
    ]
    
    return invoicing_status


@register.filter
def invoicing_status(value):
    invoicing_status = invoicing_status_list()
    invoicing_status_dict = dict(invoicing_status)
    return invoicing_status_dict[value]

def market_list():
    market = [
    ('', '--Select--'),
    (1, 'AL'),
    (2, 'LA'),
    (3, 'FL'),
    (4, 'MS')
    ]
    return market


@register.filter
def market(value):
    market = market_list()
    market_dict = dict(market)
    return market_dict[value]

def cutlast(value, elements):
    return str(value[:len(value)-elements])

register.filter("mycut",cutlast)