import firebase_admin
from firebase_admin import credentials, db
import os

certificate = os.path.dirname(__file__) + os.environ.get("KEY_LOCATION")
cred = credentials.Certificate(cert=certificate)

firebase_admin.initialize_app(credential=cred, options={
	"databaseURL": os.environ.get("FIREBASE_DB_URL")
})

ref = db.reference('/status')