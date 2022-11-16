    public int updateBoard(Connection conn , Board b) {
        
        int result = 0;
        PreparedStatement psmt = null;
        String sql = prop.getProperty("updateBoard");
        
        try {
            psmt = conn.prepareStatement(sql);
            
            psmt.setString(1, b.getbTitle());
            psmt.setString(2, b.getbWriter());
            psmt.setString(3, b.getbContent());
            
            result = psmt.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(psmt);
        }
        
        return result;
    }