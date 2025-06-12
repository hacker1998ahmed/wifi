package com.wimax_flutter;

public class CustomAction {
    private String command;
    private boolean isRootRequired;

    public CustomAction(String command, boolean isRootRequired) {
        this.command = command;
        this.isRootRequired = isRootRequired;
    }

    public void execute() {
        Shell.runCommand(isRootRequired ? "su -c '" + command + "'" : command);
    }
}