package com.dao.impl;

import com.dao.HouseDao;
import com.model.House;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;
import javax.sql.DataSource;

/**
 *
 * @author Administrator
 */
public class HouseDaoImpl implements HouseDao {

    private final DataSource dataSource;

    public HouseDaoImpl(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public Set<House> read() {
        String req = "Select * from houses";
        Set<House> houses;
        try (Connection connection = dataSource.getConnection()) {
            try (Statement statement = connection.createStatement(); ResultSet resultSet = statement.executeQuery(req)) {
                houses = new HashSet<>();
                while (resultSet.next()) {//пока есть записи 
                    int id = resultSet.getInt("id");
                    String userEmail = resultSet.getString("user_email");
                    int apartmentNumber = resultSet.getInt("apartment_number");
                    double apartmentArea = resultSet.getDouble("apartment_area");
                    int floor = resultSet.getInt("floor");
                    int roomsCount = resultSet.getInt("rooms_count");
                    String street = resultSet.getString("street");
                    String buildingType = resultSet.getString("building_type");
                    double lifeTime = resultSet.getDouble("life_time");

                    houses.add(new House(id, userEmail, apartmentNumber, apartmentArea, floor, roomsCount, street, buildingType, lifeTime));
                }
            }
            return houses;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    @Override
    public int create(House house) {
        try (Connection conn = dataSource.getConnection()) {//установление соединения (получение соединения)
            int id;

            String sql = "insert into houses(user_email,apartment_number,apartment_area,floor,rooms_count,street,building_type,life_time) values(?,?,?,?,?,?,?,?)";//формирование запроса добавления
            try (PreparedStatement preparedStatement = conn.prepareStatement(sql)) {//в наш подготовленный запрос передаём строку с запросом
                preparedStatement.setString(1, house.userEmail());
                preparedStatement.setInt(2, house.apartmentNumber());
                preparedStatement.setDouble(3, house.apartmentArea());
                preparedStatement.setInt(4, house.floor());
                preparedStatement.setInt(5, house.roomsCount());
                preparedStatement.setString(6, house.street());
                preparedStatement.setString(7, house.buildingType());
                preparedStatement.setDouble(8, house.lifetime());
//переданный запрос меняем, указываем позицию ? и чем мы его занимаем, отсчёт с 1
                int affectedRows = preparedStatement.executeUpdate();//количество добавленных строчек

                if (affectedRows == 0) {// если строчки не добавлены выбрасывается исключение 
                    throw new SQLException("Creating house failed, no rows affected.");
                }
                sql = "SELECT * FROM houses ORDER BY id DESC LIMIT 1;";//сортируем в обратном порядке записи(от максимального до минимального) в бд и получаем первую строчку
                try (Statement st = conn.createStatement(); ResultSet rs = st.executeQuery(sql)) {
                    if (rs.next()) {//если результат имеет хотя бы 1у запись
                        id = rs.getInt("id"); //берём id свежесозданной строчки 
                    } else {
                        throw new SQLException("Creating user failed, no ID obtained.");
                    }
                }
            }
            return id;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    @Override
    public int update(House house) {
        try (Connection conn = dataSource.getConnection()) {
            String query = "UPDATE houses SET user_email =?, apartment_number =?, apartment_area =?, floor =?, rooms_count =?, street =?, building_type =?, life_time =? WHERE id =?";
            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                preparedStatement.setString(1, house.userEmail());
                preparedStatement.setInt(2, house.apartmentNumber());
                preparedStatement.setDouble(3, house.apartmentArea());
                preparedStatement.setInt(4, house.floor());
                preparedStatement.setInt(5, house.roomsCount());
                preparedStatement.setString(6, house.street());
                preparedStatement.setString(7, house.buildingType());
                preparedStatement.setDouble(8, house.lifetime());
                preparedStatement.setInt(9, house.id());
                return preparedStatement.executeUpdate();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }

    @Override
    public int delete(House house) {
        try (Connection connection = dataSource.getConnection()) {
            String query = "delete from houses where id = ?";
            try (PreparedStatement preparedStmt = connection.prepareStatement(query)) {
                preparedStmt.setInt(1, house.id());
                int res = preparedStmt.executeUpdate();
                return res;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return -1;
        }
    }
}
