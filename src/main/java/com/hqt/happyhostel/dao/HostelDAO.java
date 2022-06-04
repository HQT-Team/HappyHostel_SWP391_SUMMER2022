package com.hqt.happyhostel.dao;

import com.hqt.happyhostel.dto.Hostels;
import com.hqt.happyhostel.dto.Services;
import com.hqt.happyhostel.utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HostelDAO {
    public static final String GET_HOSTEL =
            "SELECT hostel_id, owner_account_id, name, address, ward, district, city FROM [dbo].[Hostels]";
    public static final String INSERT_HOSTEl =
            "INSERT INTO [dbo].[Hostels](owner_account_id, name, address, ward, district, city) values(?, ?, ?, ?, ?, ?)";
    public static final String INSERT_SERVICE =
            "INSERT INTO [dbo].[Services](service_name) values(?)";
    public static final String INSERT_HOSTEL_SERVICE =
            "INSERT INTO [dbo].[HostelService](hostel_id, service_id, service_price, valid_date) values(?, ?, ?, ?)";
    public static final String UPDATE_HOSTEL =
            "UPDATE Hostels SET name = ?, address = ?, ward = ?, district = ?, city = ? WHERE hostel_id = ?";
    public static final String GET_HOSTEL_BY_ID =
            "SELECT hostel_id, owner_account_id, name, address, ward, district, city FROM [dbo].[Hostels] WHERE hostel_id = ?";

    public Hostels getHostelById(int hostelId) throws SQLException  {
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        Hostels hostel = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                pst = cn.prepareStatement(GET_HOSTEL_BY_ID);
                pst.setInt(1, hostelId);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int hostelOwnerAccountID = rs.getInt("owner_account_id");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String ward = rs.getString("ward");
                    String district = rs.getString("district");
                    String city = rs.getString("city");
                    hostel = new Hostels(hostelId, hostelOwnerAccountID, name, address, ward, district, city);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return hostel;
    }

    public List<Hostels> getListHostels() throws SQLException {
        List<Hostels> listHostels = new ArrayList<>();
        Connection cn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                st = cn.createStatement();
                rs = st.executeQuery(GET_HOSTEL);
                while (rs != null && rs.next()) {
                    int hostelID = rs.getInt("hostel_id");
                    int hostelOwnerAccountID = rs.getInt("owner_account_id");
                    String name = rs.getString("name");
                    String address = rs.getString("address");
                    String ward = rs.getString("ward");
                    String district = rs.getString("district");
                    String city = rs.getString("city");
                    listHostels.add(new Hostels(hostelID, hostelOwnerAccountID, name, address, ward, district, city));
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return listHostels;
    }

    public boolean addHostel(Hostels hostel, List<Services> services) throws SQLException {
        boolean check = false;
        Connection cn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;

        try {
            cn = DBUtils.makeConnection();
            cn.setAutoCommit(false);
            if (cn != null) {
                ptm = cn.prepareStatement(INSERT_HOSTEl, Statement.RETURN_GENERATED_KEYS);
                ptm.setInt(1, hostel.getHostelOwnerAccountID());
                ptm.setString(2, hostel.getHostelName());
                ptm.setString(3, hostel.getAddress());
                ptm.setString(4, hostel.getWard());
                ptm.setString(5, hostel.getDistrict());
                ptm.setString(6, hostel.getCity());
                check = ptm.executeUpdate() > 0 ? true : false;

                rs = ptm.getGeneratedKeys();
                if (rs.next()) {
                    hostel.setHostelID(rs.getInt(1));
                }

                ptm.close();

                for (Services ser : services
                ) {
                    ptm = cn.prepareStatement(INSERT_SERVICE, Statement.RETURN_GENERATED_KEYS);
                    ptm.setString(1, ser.getServiceName());

                    check = ptm.executeUpdate() > 0 ? true : false;
                    rs = ptm.getGeneratedKeys();
                    if (rs.next()) {
                        ser.setServiceID(rs.getInt(1));
                    }

                    ptm.close();

                    ptm = cn.prepareStatement(INSERT_HOSTEL_SERVICE);
                    ptm.setInt(1, hostel.getHostelID());
                    ptm.setInt(2, ser.getServiceID());
                    ptm.setDouble(3, ser.getServicePrice());
                    ptm.setString(4, ser.getValidDate());
                    check = ptm.executeUpdate() > 0 ? true : false;
                    ptm.close();

                }

            }
            if (!check) {
                cn.rollback();
            } else {
                cn.commit();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return check;
    }

    public boolean updateHostel(Hostels hostel, int hostelID) throws SQLException {
        boolean checkUpdate = false;
        Connection cn = null;
        PreparedStatement ptm = null;
        try {
            cn = DBUtils.makeConnection();
            cn.setAutoCommit(false);
            if (cn != null) {
                ptm = cn.prepareStatement(UPDATE_HOSTEL);
                ptm.setString(1, hostel.getHostelName());
                ptm.setString(2, hostel.getAddress());
                ptm.setString(3, hostel.getWard());
                ptm.setString(4, hostel.getDistrict());
                ptm.setString(5, hostel.getCity());
                ptm.setInt(6, hostelID);
                checkUpdate = ptm.executeUpdate() > 0 ? true : false;
            }

            if (!checkUpdate) {
                cn.rollback();
            } else {
                cn.commit();
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return checkUpdate;
    }
}