from rest_framework import viewsets, permissions, filters
from django_filters.rest_framework import DjangoFilterBackend
from django.db.models import Q, When, Case

from . import serializers, models


class ExerciseViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows exercises to be viewed or edited.
    """
    queryset = models.Exercise.objects.all()
    serializer_class = serializers.ExerciseSerializer

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            self.permission_classes = [permissions.IsAuthenticated]
        else:
            self.permission_classes = [permissions.AllowAny]

        return super().get_permissions()


class WorkoutViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows exercises to be viewed or edited.
    """
    queryset = models.Workout.objects.all()
    serializer_class = serializers.WorkoutSerializer
    filter_backends = [DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter]
    search_fields = ['title', 'description', 'author__username']
    filterset_fields = ['visibility',]
    ordering_fields = ['title', 'sum_of_cb', 'difficulty', 'avg_time']

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            self.permission_classes = [permissions.IsAuthenticated]
        else:
            self.permission_classes = [permissions.AllowAny]

        return super().get_permissions()

    def get_queryset(self):
        queryset_for_hidden = (Q(visibility=models.Workout.HIDDEN) & Q(author=self.request.user))
        queryset_for_public = Q(visibility=models.Workout.PUBLIC)

        if self.request.user.is_anonymous:
            return self.queryset.filter( queryset_for_public )    
        return self.queryset.filter( queryset_for_public | queryset_for_hidden )


class ExerciseInWorkoutViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows exercises to be viewed or edited.
    """
    queryset = models.ExcerciseInWorkout.objects.all()
    serializer_class = serializers.ExerciseInWorkoutSerializer

    def get_permissions(self):
        if self.action in ['create', 'update', 'partial_update', 'destroy']:
            self.permission_classes = [permissions.IsAuthenticated]
        else:
            self.permission_classes = [permissions.AllowAny]

        return super().get_permissions()
