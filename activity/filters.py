import django_filters
from django_filters import CharFilter

from .models import *

class ActivityFilter(django_filters.FilterSet):
	#ecd = CharFilter(field_name="ecd", lookup_expr='icontains')
	#client = CharFilter(field_name="client", lookup_expr='icontains')
	#market = CharFilter(field_name='market', lookup_expr='icontains')


	class Meta:
		model = Activity
		fields = {
            'ticket': ['contains'],
            'job_no': ['contains'],
            'ewo': ['contains'],
            'da': ['contains'],
        }