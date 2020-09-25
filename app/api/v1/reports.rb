# frozen_string_literal: true

module V1
  class Reports < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :reports do
      desc 'Get tablets report'
      params do
        requires :tablet_id, type: Integer
      end
      get do
        sql = [
          'select value, id, sensor_type_id, time from sensor_checks as sc where sc.id in (
              select id
              from (
                    select id, time, value, sensor_type_id, tablet_id,
                    row_number() over (partition by date_trunc(\'hour\', time) order by time) as first_hour_item
                  from sensor_checks where sc.sensor_type_id = sensor_type_id
              ) as dt
              where first_hour_item = 1 and dt.tablet_id = ?
              )
              order by time
              ', params[:tablet_id]
        ]

        # Ususally I use GrapeEntity
        SensorCheck.find_by_sql(sql)
      end
    end
  end
end
