import cgi
import webapp2

import datetime
import urllib
import os


from google.appengine.ext import db
from google.appengine.api import users


class User_Profile(db.Model):
  user_id = db.StringProperty()
  account_created = db.DateTimeProperty(auto_now_add=True)

class MainPage(webapp2.RequestHandler):
  def get(self):
    user = users.get_current_user()
    self.response.out.write("Welcome, %s! (<a href=\"%s\">sign out</a>)" % (user.nickname(), users.create_logout_url("/")))
    u = User_Profile.all()
    u.filter("user_id =", user.user_id())
    u.fetch(1)
    self.response.out.write("%s" % u.user_id())


class Register(webapp2.RequestHandler):
  def get(self):
    self.response.out.write("""
              <form action="/account/register" method="post">
                <div><input type="submit" value="Register for account"></div>
              </form>
            </body>
          </html>""")
  def post(self):
    self.response.out.write("posting")
    # user_profile = User_Profile(user_id=users.get_current_user().user_id())
    # user_profile.put()
    # self.redirect('/account/')


app = webapp2.WSGIApplication([('/account/', MainPage),
                               ('/account/register', Register)],
                              debug=True)