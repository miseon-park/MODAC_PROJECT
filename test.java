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

        /**
     * 좋아요기능
     * @param m
     * @return
     */
    
    public int recCheck(Map<String, Object> m){
        int result = 0;
        try {
            session =getSession();
            result = (Integer) session.selectOne("board.rec_check", m);
        } catch (Exception e) {
            System.out.println("recCheck : " + e);
            e.printStackTrace();
        }
        return result;
    }
    
    // 게시글 추천
    public void recUpdate(Map<String, Object> m){
        try {
            session = getSession();
            session.insert("board.rec_update", m);
        } catch (Exception e) {
            System.out.println("recUpdate : " + e);
            e.printStackTrace();
        }
    }
    
    // 게시글 추천 제거
    public void recDelete(Map<String, Object> m){
        try {
            session = getSession();
            session.insert("board.rec_delete", m);
        } catch (Exception e) {
            System.out.println("recDelete : " + e);
            e.printStackTrace();
        }
    }
    
    // 게시글 추천수
    public int recCount(int no){
        int count = 0;
        try {
            session = getSession();
            count = (Integer) session.selectOne("board.rec_count", no);
        } catch (Exception e) {
            System.out.println("recCount : " + e);
            e.printStackTrace();
        }
        return count;
    }