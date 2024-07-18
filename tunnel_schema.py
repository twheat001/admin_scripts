#!/usr/bin/python

import sqlite3

def createdb(dbfile='tunnel.db'):
    conn = sqlite3.connect(dbfile)

    c = conn.cursor()
    # Create tables
    c.execute('''CREATE TABLE wags
                 (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)
	      ''')

    c.execute('''CREATE TABLE checks
		 (id INTEGER PRIMARY KEY AUTOINCREMENT, wags_id INTEGER, ipversion TEXT, software_version TEXT, environment TEXT, enabled INTEGER,
                  debug INTEGER)
	      ''')

    c.execute('''CREATE TABLE tunnels
		 (checks_id INTEGER, local_ip INTEGER, remote_ip INTEGER, name TEXT)
	      ''')

    c.execute('''CREATE TABLE bridge
		 (checks_id INTEGER, name TEXT, bridge_int_port_name TEXT, int_port_mac TEXT)
	      ''')

    c.execute('''CREATE TABLE namespace
		 (checks_id INTEGER, name TEXT)
	      ''')


    conn.commit()
    conn.close()

if __name__ == "__main__":
    createdb()
