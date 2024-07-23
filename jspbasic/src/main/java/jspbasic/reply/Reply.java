package jspbasic.reply; 

public class Reply {
    private int rid;
    private String mid;
    private String rcontent;
    private int bid; // 새로운 필드 추가

    public Reply() {
        // TODO Auto-generated constructor stub
    }

    public Reply(int rid, String mid, String rcontent, int bid) {
        super();
        this.rid = rid;
        this.mid = mid;
        this.rcontent = rcontent;
        this.bid = bid; // 새로운 필드 초기화
    }

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getRcontent() {
        return rcontent;
    }

    public void setRcontent(String rcontent) {
        this.rcontent = rcontent;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    @Override
    public String toString() {
        return "Reply [rid=" + rid + ", mid=" + mid + ", rcontent=" + rcontent + ", bid=" + bid + "]";
    }
}

