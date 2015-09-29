from django.db import models
from django import forms
from captcha.fields import CaptchaField

# Create your models here.
class Question(models.Model):
    def __unicode__(self):
	return self.question_text
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')

class Choice(models.Model):
    question = models.ForeignKey(Question)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)

class CaptchaTestModelForm(forms.Form):
    captcha = CaptchaField()
    username = models.CharField(max_length=200)
