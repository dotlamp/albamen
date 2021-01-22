package com.example.albamen.dto.security;

public class AuthDTO {
    private int ano;
    private int mno;
    private int cno;
    private String auth;

    public boolean isAuth(String role){
        return auth.equals("ROLE_"+role.toUpperCase());
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public int getMno() {
        return mno;
    }

    public void setMno(int mno) {
        this.mno = mno;
    }

    public int getCno() {
        return cno;
    }

    public void setCno(int cno) {
        this.cno = cno;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    @Override
    public String toString() {
        return "AuthDTO{" +
                "ano=" + ano +
                ", mno=" + mno +
                ", cno=" + cno +
                ", auth='" + auth + '\'' +
                '}';
    }
}
