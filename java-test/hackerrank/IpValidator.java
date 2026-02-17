class IpValidator {
    public String pattern;

    public IpValidator() {
        String slot = "([01]?\\d{1,2}|2[0-4]\\d|25[0-5])";
        pattern = String.format("(%s\\.){3}(%s)", slot, slot);
    }
}