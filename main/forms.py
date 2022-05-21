from logging import PlaceHolder
from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import get_user_model

User = get_user_model()

# Create your forms here.

class NewUserForm(UserCreationForm):
	# email = forms.EmailField(required=True, widget= forms.TextInput(attrs={'placeholder':'Enter your first name'}))
    username = forms.CharField(widget= forms.TextInput(attrs={'placeholder': 'Username'}))
    first_name = forms.CharField(widget= forms.TextInput(attrs={'placeholder': 'First Name'}), max_length=32, help_text='First name')
    last_name=forms.CharField(widget= forms.TextInput(attrs={'placeholder': 'Last Name'}), max_length=32, help_text='Last name')
    email=forms.EmailField(widget= forms.EmailInput(attrs={'placeholder': 'Email'}), max_length=64, help_text='Enter a valid email address')
    password1=forms.CharField(widget= forms.PasswordInput(attrs={'placeholder': 'Password'}))
    password2=forms.CharField(widget= forms.PasswordInput(attrs={'placeholder': 'Password Again'}))


    class Meta:
        model = User
        fields = UserCreationForm.Meta.fields + ("username", "first_name", "last_name", "email", "password1", "password2")

    def save(self, commit=True):
        user = super(NewUserForm, self).save(commit=False)
        user.email = self.cleaned_data['email']
        if commit:
            user.save()
        return user