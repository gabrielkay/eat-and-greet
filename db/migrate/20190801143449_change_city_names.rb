class ChangeCityNames < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
        UPDATE users
        SET location = 'Raleigh-Durham, NC'
        WHERE location = 'Raleigh-Durham';

        UPDATE users
        SET location = 'Denver-Boulder, CO'
        WHERE location = 'Denver/Boulder';

        UPDATE users
        SET location = 'Washington, DC'
        WHERE location = 'Washington D.C. Metro';

        UPDATE events
        SET city = 'Raleigh-Durham, NC'
        WHERE city = 'Raleigh-Durham';

        UPDATE events
        SET city = 'Denver-Boulder, CO'
        WHERE city = 'Denver/Boulder';

        UPDATE events
        SET city = 'Washington, DC'
        WHERE city = 'Washington D.C. Metro';
      SQL
  end

  def down
    execute <<-SQL
        UPDATE users
        SET location = 'Raleigh-Durham'
        WHERE location = 'Raleigh-Durham, NC';

        UPDATE users
        SET location = 'Denver/Boulder'
        WHERE location = 'Denver-Boulder, CO';

        UPDATE users
        SET location = 'Washington D.C. Metro'
        WHERE location = 'Washington, DC';

        UPDATE events
        SET city = 'Raleigh-Durham'
        WHERE city = 'Raleigh-Durham, NC';

        UPDATE events
        SET city = 'Denver/Boulder'
        WHERE city = 'Denver-Boulder, CO';

        UPDATE events
        SET city = 'Washington D.C. Metro'
        WHERE city = 'Washington, DC';
      SQL
  end
end
