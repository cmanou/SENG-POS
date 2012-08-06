import cgi
import webapp2

import datetime
import urllib
import os


from google.appengine.ext import db
from google.appengine.api import users


class Admin_Profile(db.Model):
  admin_id = db.StringProperty()
  account_created = db.DateTimeProperty(auto_now_add=True)
  privileges = db.StringProperty()

class MainPage(webapp2.RequestHandler):
  def get(self):
    user = users.get_current_user()
    self.response.out.write("Welcome, %s! (<a href=\"%s\">sign out</a>)" % (user.nickname(), users.create_logout_url("/")))
    


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
    

app = webapp2.WSGIApplication([('/admin/', MainPage),
                               ('/admin/register', Register)],
                              debug=True)