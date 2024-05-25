package main.model;

public class City {
    private static final String COUNTRY = "FK";
    private String name;
    private double flat;
    private double lng;

    public City(String name, double flat, double lng) {
        this.name = name;
        this.flat = flat;
        this.lng = lng;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getFlat() {
        return flat;
    }

    public void setFlat(double flat) {
        this.flat = flat;
    }

    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }
}
