from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

@app.route('/addplayercharacter/<message>', methods=['POST'])
def add_new_player_character():
    data = request.get_json()

    if not data:
        return jsonify({'error': 'No data provided'}), 400
    
    id = data.get('id')
    name = data.get('character_name')
    character_rank = data.get('character_rank')
    character_type = data.get('character_type')
    character_inspiration = data.get('character_inspiration')
    character_level = data.get('character_level')
    character_xp = data.get('character_xp')
    damage_done = 0
    damage_taken = 0
    healing_done = 0
    healing_taken = 0
    criticals_given = 0
    criticals_fails = 0
    character_initiative = 0
    character_speed = data.get('character_speed')
    character_hp = data.get('character_hp')
    character_ac = data.get('character_ac')
    character_prof_bonus = data.get('character_prof_bonus')
    charcter_strength = data.get('charcter_strength')
    character_dex = data.get('character_dex')
    character_con = data.get('character_con')
    character_intel = data.get('character_intel')
    character_wisdom = data.get('character_wisdom')
    character_charisma = data.get('character_charisma')

    try:
        connection = psycopg2.connect("dbname='dnd' user='postgres' host='localhost' password='password'")
        cursor = connection.cursor()
        cursor.execute('''INSERT INTO player_characters (id, character_name, character_rank, character_type, 
                       character_inspiration, character_level, character_xp, damage_done, damage_taken, 
                       healing_done, healing_taken, criticals_given, criticals_fails, character_initiative, 
                       character_speed, character_hp, character_ac, character_prof_bonus, charcter_strength, 
                       character_dex, character_con, character_intel, character_wisdom, character_charisma) 
                       VALUES (%d, %s, %s, %s, %d, %d, %d, %s, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d)''', 
                       (id, name, character_rank, character_type, character_inspiration, character_level, character_xp, damage_done, 
                        damage_taken, healing_done, healing_taken, criticals_given, criticals_fails, character_initiative, character_speed, 
                        character_hp, character_ac, character_prof_bonus, charcter_strength, character_dex, character_con, character_intel, 
                        character_wisdom, character_charisma))
        
        connection.commit()
        cursor.close()
        connection.close()
    except (Exception, psycopg2.Error) as error:
        return jsonify({'error': error}), 400
    
    return jsonify({'message': 'Character added successfully'}), 201

                       



if __name__ == '__main__':
    app.run()