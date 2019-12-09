from flask.blueprints import Blueprint
from flask import current_app, request
bp = Blueprint('main', __name__)

from app.main import routes

@bp.context_processor
def inject_available_lang():
    return dict(AVAILIBLE_LANGUAGES=current_app.config['LANGUAGES'],
                CURRENT_LANGUAGE=request.accept_languages.best_match(current_app.config['LANGUAGES'].keys()))

