from django.urls import path

from . import views

urlpatterns = [
    path('synchronize/', views.SyncStats.as_view()),
    path('stats_calories/', views.StatisticCaloriesList.as_view()),
    path('stats_calories/<int:pk>/', views.StatisticCaloriesDetail.as_view()),
    path('stats_exercise/', views.StatisticExerciseList.as_view()),
    path('stats_exercise/<int:pk>/', views.StatisticExerciseDetail.as_view()),
]