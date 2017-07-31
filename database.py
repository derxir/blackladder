# -*- coding:utf-8 -*-
# --- SQLALCHEMY SUPPORT

from extensions import db


def drop_all():
    db.drop_all()


def create_all():
    db.create_all()


def remove_session():
    db.session.remove()

# --- SQLALCHEMY SUPPORT END
