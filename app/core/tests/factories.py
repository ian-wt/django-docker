from django.conf import settings

from factory import Sequence, SubFactory, LazyAttribute
from factory.django import DjangoModelFactory

from ..models import UserProfile


class UserFactory(DjangoModelFactory):

    class Meta:
        model = settings.AUTH_USER_MODEL

    first_name = "John"
    last_name = Sequence(lambda n: "Smith-{}".format(n))
    email = LazyAttribute(lambda obj: "{}.{}@example.com"
                          .format(obj.first_name, obj.last_name))


class UserProfileFactory(DjangoModelFactory):

    class Meta:
        model = UserProfile

    user = SubFactory(UserFactory)
